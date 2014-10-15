module Spree
	Spree::Product.class_eval do
    add_search_scope :in_all_taxons do |*taxons|
        taxons = get_taxons(taxons)
        id = arel_table[:id]
        joins(:taxons).where(spree_taxons: { id: taxons }).group(id).having(id.count.eq(taxons.size))
    end
	end
end