Config {
         font = "xft:Sans-12:bold"
       , bgColor = "#333134"
       , fgColor = "#D0CDD9"
       , border = NoBorder
       , borderColor = "#D0CDD9"
       , position = TopW L 100
       , lowerOnStart = False
       , commands = [
                      Run Cpu [
                        "-L","3"
                        ,"-H","50"
                        ,"--normal","green"
                        ,"--high","red"
                        ] 10
                    , Run Memory [
                        "-t","Mem: <usedratio>%"
                        ] 10
                    , Run Date "%a %b %_d %Y %H:%M" "date" 10
                    , Run Battery [
                        "-t", " <acstatus> "
                        ,"-L", "20"
                        ,"-H","80"
                        ,"--low","#f44336"
                        ,"--normal","#ffffff"
                        ,"--",
                          "-o","<left>%(<timeleft>)"
                          ,"-O","Charging<left>%"
                          ,"-i","<left>%"
                        ] 50
                    , Run Wireless "wlp2s0" [ "-t", "<essid>" ] 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% } { %cpu% %memory% | %battery% | %wlp2s0wi% | %date% "
       }

