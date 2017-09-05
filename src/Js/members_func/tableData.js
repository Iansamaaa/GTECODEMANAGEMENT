$(document).ready(function() {
    $('#dataTable').dataTable({
      "iDisplayLength": 5,
      "aLengthMenu": [[5,10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
      "aaSorting": [[0, "asc"]],

        "ajax": "../../Vb/commands/members/members.view.asp",
        "columns": [
            { "data": "Username" },
            { "data": "FirstName" },
            { "data": "LastName" },
            { "data": "Accounttype" }
        ]
});
} );
