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
    language:
      search: "Search here:"
    fnDrawCallback: ->
      paginate_show = $(".dataTables_paginate").find("span > a").length > 1
      $paginate = $(".dataTables_paginate")
      if paginate_show then $paginate.show() else $paginate.hide()

      table_show = $(".dataTables_empty").length == 0
      $table = $(".dataTables_wrapper table")
      if table_show then $table.show() else $table.hide()
      return

