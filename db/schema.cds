using {cuid} from '@sap/cds/common';


namespace sap.capire.taskmanager;

entity Employees : cuid {
    name          : String(100);
    email         : String(255);
    department    : Association to Departments;
    assignedTasks : Association to many Tasks
                        on assignedTasks.assignedTo = $self
};

entity Departments : cuid {
    name        : String(100);
    code        : String(3);
    description : String(1000);
    employees   : Association to many Employees
                      on employees.department = $self;
};

entity Tasks : cuid {
    title       : String(255);
    description : String(1000);
    dueDate     : Date;
    priority    : Integer enum {
        low = 1;
        medium = 2;
        high = 3;
    }
    status      : String(20) enum {
        pending = 'Pending';
        inProgress = 'In Progress';
        completed = 'Completed'
    } default 'Pending';

    assignedTo  : Association to Employees
};
