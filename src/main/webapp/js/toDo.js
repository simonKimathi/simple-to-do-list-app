(function(){
    SystechSkulJsLib.showGrid.call({
        dataUrl: 'task',
        gridStyle:'customers',
        componentId:'department',
        gridColumns:[{
            header:'task name',
            dataIndex:'name'
        },{
            header:'task description',
            dataIndex:'description'
        },{
            header:'task status',
            dataIndex:'status'
        }],
        gridButtons:[{
            label: 'Add to Do',
            cssClass: 'addButton',
            handler: 'addButton',
            id: 'org-addButton',
        }/*,{
            label: 'Edit department',
            cssClass: 'editButton',
            handler: 'editButton',
            id: 'org-editButton',
        },{
            label: 'Delete department',
            cssClass: 'deleteButton',
            handler: 'deleteButton',
            id: 'org-deleteButton',
        }*/],
        formField:[{
            label: 'task name',
            name: 'name',
            type: 'text',
            id: 'org-name'
        },{
            label: 'task description',
            name: 'description',
            type: 'text',
            id: 'org-description'
        },{
            label: 'task status',
            name: 'status',
            type: 'text',
            id: 'org-status'
        }]
    });
})();