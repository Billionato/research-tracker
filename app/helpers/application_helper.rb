module ApplicationHelper
    
    # Helper for Markdown
    def markdown(text)
        if !text.nil?
            options = [:filter_html, :autolink]
            RDiscount.new(text, *options).to_html.html_safe
        else
            return nil
        end
    end
    
end
