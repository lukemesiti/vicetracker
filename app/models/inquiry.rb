class Inquiry
    extend ActiveModel::Naming
    extend ActiveModel::Conversion

    attr_accessor :name, :email, :message

    def initialize(attributes = {})
        attributes.each do |name, value|
            send("#{name}=", value)
        end
    end

    def deliver
        true
    end

    def persisted?
        false
    end
end