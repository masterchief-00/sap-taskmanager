sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ns/employee/test/integration/pages/EmployeesList",
	"ns/employee/test/integration/pages/EmployeesObjectPage",
	"ns/employee/test/integration/pages/TasksObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, TasksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ns/employee') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheTasksObjectPage: TasksObjectPage
        },
        async: true
    });

    return runner;
});

