$ ->
  $('#users-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#users-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: "name"},
      {data: "phone"},
      {data: "address"},
      {data: "edit"},
      {data: "destroy"}
    ]
    aoColumnDefs: [
      {sClass: "align-center", aTargets: [3, 4]}
    ]