module ApplicationHelper

    def link_to_add_fields(name, form, association)

        #create a new object from the association (:comment)
        new_object = form.object.send(association).klass.new
        
        # create or take id from newly created object
        id = new_object.object_id
        fields = form.fields_for(association, new_object, child_index: id) do |builder|
           render(association.to_s.singularize + "_fields", form: builder)
        end

        #pass down link to issues form
        link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})

    end

end
