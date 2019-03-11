ActiveAdmin.register Pattern do
  
  permit_params :b_solution, :solution

  index do
    selectable_column
    id_column
    column :pattern_name
    actions
  end

  form do |f|
    f.inputs do
      f.input :b_solution
      f.input :solution
    end
    f.actions
  end

end
