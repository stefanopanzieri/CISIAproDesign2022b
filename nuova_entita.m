

% cerca l'id_type dall name_type
                query2=strcat('SELECT * FROM entity_type WHERE name_type=''',app.typeDropDown.Value,''' AND id_project=',string(app.id_project));
                data2=fetch(app.connection, query2);
                id_type=data2.id_type(1);


% crea l'entity
id_entity=app.new_entity();
query=strcat('INSERT INTO entity (id_entity, id_project, id_type, name_entity) VALUES (',string(id_entity) ,',',string(app.id_project),',' ,string(id_type) ,',''',app.nameEditField.Value, ''')');
execute(app.connection,query)


% verifico se ci sono altre entità dello stesso tipo
query=strcat('SELECT * from entity WHERE id_type=',string(id_type), ' AND id_entity<>',string(id_entity) ,' AND id_project=',string(app.id_project));
data=fetch(app.connection,query);


if height(data)>0 % esistono altre entità dello steso tipo
                        id_entity2=data.id_entity(1); % prede la prima
                    
                        
                        % verifico se ci sono variabili di stato assegnate
                        % all'entità selezionata
                        query=strcat('SELECT DISTINCT id_var,val_type,val_status FROM status WHERE id_entity=',string(id_entity2),' AND id_project=',string(app.id_project));
                        data2=fetch(app.connection,query);
                        
                        %disp(data2)
                        
                        if height(data2)>0 % esistono altre variabili
                            for i=1:height(data2)
                                query=strcat('INSERT INTO status (id_entity,id_var,val_type,val_status,id_project) VALUES(',string(id_entity),',',string(data2.id_var(i)),',''',data2.val_type(i),''',''',string(data2.val_status(i)),''',',string(app.id_project),')');
                                execute(app.connection,query);
                            end
                            
                        end
                        
                        
                        % verifico se ci sono input o output da assegnare
                        query=strcat('SELECT type_port,id_res FROM entity_port WHERE id_entity=',string(id_entity2),' AND id_project=',string(app.id_project));
                        data3=fetch(app.connection,query);
                        
                        if height(data3)>0 % esistono porte di input e/o output
                            for i=1:height(data3)
                                query=strcat('INSERT INTO entity_port (id_port, id_entity,type_port, id_res,id_project) VALUES(NULL,',string(id_entity),',''',string(data3.type_port(i)),''',',string(data3.id_res(i)),',',string(app.id_project),')');
                                execute(app.connection,query);
                            end
                            
                        end
                        
                        
                        
else % is the first entity of this entity type
    % ERRORE
       
end
