class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to, :user_path, :edit_user_path

  def sortable_columns
    @sortable_columns ||= ['users.name', 'users.phone', 'users.address']
  end

  def searchable_columns
    @searchable_columns ||= ['users.name', 'users.phone', 'users.address']
  end

  private

  def sort_records(records)
    params[:columns].keys.each{ |k| params[:columns][k][:data] = k}
    super
  end

  def data
    records.map do |record|
      {
        name: link_to(record.name, user_path(record)),
        phone: record.phone,
        address: record.address,
        edit: link_to('Edit', edit_user_path(record)),
        destroy: link_to('Destroy', user_path(record),
          data: {confirm: "Are you sure?"}, method: :delete)
      }
    end
  end

  def get_raw_records
    User.all
  end
end
