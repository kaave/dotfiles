#!/usr/bin/env ruby

asdf_path = '~/.asdf'
setup_repository = "git clone https://github.com/asdf-vm/asdf.git #{asdf_path} && " +
  "cd #{asdf_path} && " +
  'git checkout $(git describe --abbrev=0 --tags)'
plugins = [
  {
    name: :ruby,
    versions: ['3.0.0'],
    default_packages: {
      from: '~/dotfiles/default_libraries/default-gems',
      to: '~/.default-gems'
    }
  },
  {
    name: :nodejs,
    versions: ['14.15.4'],
    default_packages: {
      from: '~/dotfiles/default_libraries/default-npms',
      to: '~/.default-npm-packages'
    },
    pre_install_tasks: [
      'bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring'
    ]
  },
  {
    name: :python,
    versions: ['3.9.1', '2.7.18'],
    default_packages: {
      from: '~/dotfiles/default_libraries/default-pips',
      to: '~/.default-python-packages'
    },
    post_install_tasks: [
      `bash -lc "asdf rehash python`
    ]
  },
  # {
  #   name: :php,
  # },
  # {
  #   name: :golang,
  #   versions: ['1.13.5']
  # },
  # {
  #   name: :java,
  #   versions: ['adopt-openjdk-13.0.1+9_openj9-0.17.0']
  # },
  # {
  #   name: :scala,
  #   versions: ['2.13.1']
  # },
  # {
  #   name: :erlang,
  #   versions: ['22.2.1']
  # },
  # {
  #   name: :elixir,
  #   versions: ['1.9.4']
  # },
  # {
  #   name: :haxe,
  #   versions: ['4.0.5']
  # },
  {
    name: :flutter,
    versions: ['1.22.5-stable']
  },
]

`#{setup_repository}`

plugins.each do |plugin|
  `bash -lc "asdf plugin-add #{plugin[:name]}"`

  if plugin[:pre_install_tasks]
    plugin[:pre_install_tasks].each do |task|
      `#{task}`
    end
  end

  if plugin[:default_packages]
    `ln -s #{plugin[:default_packages][:from]} #{plugin[:default_packages][:to]}`
  end

  plugin[:versions].each do |version|
    `bash -lc "asdf install #{plugin[:name]} #{version}"`
  end

  `bash -lc "asdf global #{plugin[:name]} #{plugin[:versions].join(' ')}"`

  if plugin[:post_install_tasks]
    plugin[:post_install_tasks].each do |task|
      `#{task}`
    end
  end
end

