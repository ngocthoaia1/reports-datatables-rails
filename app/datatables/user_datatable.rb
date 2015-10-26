class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    @sortable_columns ||= ['users.name', 'users.phone', 'users.address']
  end

  def searchable_columns
    @searchable_columns ||= ['users.name', 'users.phone', 'users.address']
  end

  private

  def data
    records.map do |record|
      [
        record.name,
        record.phone,
        record.address
      ]
    end
  end

  def get_raw_records
    User.all
  end
end
