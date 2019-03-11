ActiveAdmin.register Member do
  
  permit_params :member_id, :hashed_id

  index do
    selectable_column
    id_column
    column :member_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :member_id
      f.input :hashed_id
    end
    f.actions
  end

end
