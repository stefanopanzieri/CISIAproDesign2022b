javaaddpath mysql-connector-java-8.0.17.jar

connection.databasename = '';
connection.user='root';
connection.password='cisia_mat';
connection.driver = 'com.mysql.cj.jdbc.Driver';
%connection.driver = 'com.mysql.jdbc.Driver';
connection.url = ['jdbc:mysql://' 'localhost:3306' '/'];
connection.schema='resisto';

save('cisia_init.mat','connection')



%com.mysql.cj.jdbc.Driver
%/Users/Stefano/Google Drive/MATLAB/CISIApro2.0/CISIAproDesign/mysql-connector-java-8.0.17.jar 
    


%cisia.conn = database('cisia','root','cisia_mat');
test_conn = database(connection.databasename,connection.user,connection.password,connection.driver,connection.url)
execute(test_conn,['USE ' connection.schema])
disp(['Connected to database and schema: ' connection.schema])
%close(test_conn)
        
