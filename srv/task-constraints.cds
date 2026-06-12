using {TaskService as Service} from './task-service';

annotate Service.Employees with {
    name       @mandatory  @assert.format: '^[A-Za-z ]';
    email      @mandatory;
    department @assert: (case
                             when not exists department
                                  then 'Specified department does not exist'
                         end);
};

annotate Service.Departments with {
    name  @mandatory  @assert.format: '^[A-Za-z ]';
    code  @mandatory  @assert.format: '^[A-Z]{3}'
};

annotate Service.Tasks with {
    title        @mandatory  @assert.format: '^[A-Za-z ]';
    description  @mandatory  @assert.format: '^[A-Za-z0-9. ]'
};
