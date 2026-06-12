using {sap.capire.taskmanager as my} from '../db/schema';

service TaskService @(
    requires: 'authenticated-user',
    odata   : '/admin'
) {
    @odata.draft.enabled
    entity Employees   as projection on my.Employees;
    @odata.draft.enabled
    entity Tasks       as projection on my.Tasks;
    @odata.draft.enabled
    entity Departments as projection on my.Departments
}
