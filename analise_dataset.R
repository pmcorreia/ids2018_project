library("RSQLite")
# connect to the sqlite file
con = dbConnect(drv=RSQLite::SQLite(), dbname="database.sqlite")
# get a list of all tables
alltables = dbListTables(con)

alltables
# get the populationtable as a data.frame
p1 = dbGetQuery( con,'select * from Player' )
# count the areas in the SQLite table
p2 = dbGetQuery( con,'select * from Team' )
#p2 = dbGetQuery( con,'select count(*) from Team' )
# find entries of the DB from the last week
#p3 = dbGetQuery(con, "SELECT population WHERE DATE(timeStamp) < DATE('now', 'weekday 0', '-7 days')")
#Clear the results of the last query
#dbClearResult(p3)
#Select population with managerial type of job
#p4 = dbGetQuery(con, "select * from populationtable where jobdescription like '%manager%'")

p3 = dbGetQuery( con,'select * from Match' )
index_team_home = which(p2[["team_api_id"]]==p3[1000,8])
p2[index_team_home,]
index_team_away = which(p2[["team_api_id"]]==p3[1000,9])
p2[index_team_away,]

p1[which(p1[["player_api_id"]]==20747),]#Liege goalkeeper