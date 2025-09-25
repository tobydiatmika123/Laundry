module ApplicationHelper
  def format_rupiah(amount)
    return "-" if amount.blank?
    number_to_currency(amount * 1000, unit: "Rp ", separator: ",", delimiter: ".")
  end
end
