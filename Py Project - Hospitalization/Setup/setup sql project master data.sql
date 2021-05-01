New DB Project Master Date
1- VS 2019 new project: SQL Server Database Project 
2- we need to create the project in our Master Data DB Git location *Create it if not there
NOTE: MAKE SURE you switch to development in git (under swtich/Checkout)
3- I like the . in the names helps in namespaces.  Lets call our project MasterData  
4- commit the empty project to github (just to make sure it works and check github the development branch)
TEST NOTE: you cannot make the tests UNTIL you add something to the project you can test.


-------------------------------------------------
Create our Master Data Project 
-Rules. 
    Each schema will get it's own folder after you make it in the security folder (which we will also create)
1- create ICD10 schema , raw
2- create folder ICD10 and tables folder under it
3- create raw folder and stored procedures
4- this will take multiple packs for raw diagnosisCodes will be 1 - 4 follow project setup "setup sql project heal warehouse"
5- Fix data by removing all gos and changing the insert statement in notepad++ to match our new table name
6- each pack will get about 2000 or so inserts from our generated scripts
7- create a post deployment script to run all packs
8- add ProcedureCodes packs