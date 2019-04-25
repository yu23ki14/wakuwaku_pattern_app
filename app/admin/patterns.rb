ActiveAdmin.register Pattern do
  
  permit_params :summary, :context, :b_problem, :problem, :b_solution, :solution, :consequence

  index do
    selectable_column
    id_column
    column :pattern_name
    column :pattern_group_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :summary
      f.input :context
      f.input :b_problem
      f.input :problem
      f.input :b_solution
      f.input :solution
      f.input :consequence
    end
    f.actions
  end

end
