module Spree
  module BaseHelper
   def taxons_tree(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      content_tag :ul, class: 'taxons-list' do
        root_taxon.children.map do |taxon|
          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
          
          content_tag :div, class: css_class do
           check_box("taxon", "",{}, taxon.id) + 
           label(:taxon, taxon.name)
          end
        end.join("\n").html_safe
      end
    end
  end
end