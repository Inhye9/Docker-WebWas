*DOMAIN
webtob1

*NODE
%SERVERNAME%	WEBTOBDIR="/home/tmax/webtob",
                SHMKEY = 54000,
                DOCROOT="/home/tmax/webtob/docs",
                PORT = "8888",
                HOSTNAME = "127.0.0.1",
                HTH = 1,
                #Group = "nobody",
                #User = "nobody",
                NODENAME = "$(NODENAME)",
                ERRORDOCUMENT = "503",
                #Options="IgnoreExpect100Continue",
                #JSVPORT = 9900,
                IPCPERM = 0777,
                LOGPERM = 0644,
                SYSLOG = "syslog"

*VHOST
bmt             DOCROOT = "%APP_DOCROOT%",
                PORT = "%SERVICE_PORT%",
                HOSTNAME = "127.0.0.1",
                HostAlias = "*",
                SERVICEORDER = "uri,ext",
                METHOD = "GET, POST, OPTIONS, -HEAD, -PUT, -DELETE",
                DEFAULTCHARSET = "UTF-8",
                LOGGING = "acc_MyGroup",
                ERRORLOG = "err_MyGroup"


*HTH_THREAD
hth_worker
                  SendfileThreads = 4,
                  AccessLogThread = Y,
                  #ReadBufSize=1048576, #1M
                  #HtmlsCompression="text/html",
                  SendfileThreshold=0,
                  WorkerThreads=8


*SVRGROUP
htmlg           SVRTYPE = HTML
#MyGroup        SVRTYPE = JSV, Vhostname = "MyGroup"

*SERVER
#MyGroup        SVGNAME = MyGroup, MinProc = 50, MaxProc = 500, ASQCount = 1

*URI
#uri1           Uri = "/static",   Svrtype = JSV ,SvrName = MyGroup, Vhostname = "MyGroup"

*ALIAS
#bmt_alias      URI = "/shared/", RealPath = "%SHARED_DOCROOT%"

*REVERSE_PROXY
bmt_proxy       vhostName="bmt",
                PathPrefix="/bmt",
                ServerPathPrefix="/bmt",
                RegExp = "!\/(static)",
                #Options = "DynamicServerAddress",
                ProxySSLFlag = Y,
                ProxySSLName = proxy_ssl1,
                ServerAddress="%JEUS_DOMAIN%",
                MinPersistentServerConnections=1,
                MaxPersistentServerConnections=30,
                PersistentServerCheckTime=60,
                PersistentServerTimeout=360,
                PersistentServerCheckUrl="/healthcheck/check.html"

*PROXY_SSL
proxy_ssl1 	Verify=0


*LOGGING
syslog          Format = "SYSLOG", FileName = "/home/tmax/webtob/log/system.log_%M%%D%%Y%", Option = "sync"
log1            Format = "DEFAULT", FileName = "/home/tmax/webtob/log/access.log_%M%%D%%Y%", Option = "sync"
log2            Format = "ERROR", FileName = "/home/tmax/webtob/log/error.log_%M%%D%%Y%", Option = "sync"
acc_MyGroup     Format = "userFormat", FileName = "/home/tmax/webtob/log/MyGroup/access.log_%M%%D%%Y%", Option = "sync"
err_MyGroup     Format = "errorFormat", FileName = "/home/tmax/webtob/log/MyGroup/error.log_%M%%D%%Y%", Option = "sync"


*USERLOGFORMAT
userFormat 	Format = "%{X-Forwarded-For}i %t \"%r\" %s %b %D \"%{Referer}i\" \"%{User-Agent}i\""
errorFormat 	Format = "%{X-Forwarded-For}i \"%r\"" 


*ERRORDOCUMENT
503                     status = 503,
                        url = "/503.html"
