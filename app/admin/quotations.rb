ActiveAdmin.register Quotation do
  
  permit_params :content, :pattern_id

  index do
    selectable_column
    id_column
    column :pattern_id
    column :content
    actions
  end

  form do |f|
    f.inputs do
      f.input :pattern_id
      f.input :content
    end
    f.actions
  end

end
