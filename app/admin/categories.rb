ActiveAdmin.register Category do
  
  permit_params :name, :description

  index do
    selectable_column
    id_column
    column :short_name
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.actions
  end

end
