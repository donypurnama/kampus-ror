ActiveAdmin.register Course do

  permit_params :title, :description, :price, :status, :image

  show do
    attributes_table do
      row :title
      row :description
      row :price
      row :status do
        number_to_currency(course.price)
      end
      row :status
      row :image do
        course.image.present? ? image_tag(course.image.url, height: 100) : content_tag(:span, "no image")
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :status, as: :select, collection: ["Active", "Not Active"], include_blank: false
      f.input :image, hint: course.image.present
      end
      f.actions
    end
end
