ActiveAdmin.register Quote do
  
  #permit_params :summary, :context, :b_problem, :problem, :b_solution, :solution, :consequence
  permit_params :content  
    
  index do
    selectable_column
    id_column
    column :content
    actions
  end

  form do |f|
    f.inputs do
      f.input :content
    end
    f.actions
  end

end
