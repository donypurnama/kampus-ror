ActiveAdmin.register Task do

  permit_params :course_id, :title, :description, :video_url, :image

  index do
    selectable_column
    column :course_id do |task|
      Course.find(task.course_id).title
    end
    column :title
    column :description
    actions
  end




  show do
    attributes_table do
        row :course_id do
          Course.find(task.course_id).title
        end
        row :title
        row :description
        row :video_url
        row :image do
           task.image.present? ? image_tag(task.image.url, height: 100) : content_tag(:span, 'No Image')
        end
      end
  end

  form do |f|
    f.inputs do
      f.input :course_id, :as => :select, :collection => Course.pluck(:title, :id)
      f.input :title
      f.input :description
      f.input :video_url
      f.input :image, hint: task.image.present? ? image_tag(task.image.url, height: 100) : content_tag(:span, 'No Image')
    end
    f.actions
  end

end
