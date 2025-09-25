# db/seeds.rb

# -----------------------------
# Customers
# -----------------------------
Customer.find_or_create_by!(name: "Toby") do |c|
  c.email = "toby@mail.com"
  c.phone = "081234567"
  c.address = "Jl. Contoh No.1"
end

Customer.find_or_create_by!(name: "Budi") do |c|
  c.email = "budi@mail.com"
  c.phone = "089876543"
  c.address = "Jl. Contoh No.2"
end

# -----------------------------
# Shoes
# -----------------------------
Shoe.find_or_create_by!(brand: "Sepatu Kecil") do |s|
  s.size = "Kecil"
  s.color = "Putih"
  s.material = "Canvas"
  s.condition = "Baru"
  s.price = 25000
end

Shoe.find_or_create_by!(brand: "Sepatu Sedang") do |s|
  s.size = "Sedang"
  s.color = "Hitam"
  s.material = "Leather"
  s.condition = "Baru"
  s.price = 35000
end

Shoe.find_or_create_by!(brand: "Sepatu Besar") do |s|
  s.size = "Besar"
  s.color = "Cokelat"
  s.material = "Leather"
  s.condition = "Baru"
  s.price = 45000
end

# -----------------------------
# Services
# -----------------------------
services = [
  { name: "Easy Wash",   description: "Cuci standar cepat", price: 30000 },
  { name: "Unyellowing", description: "Hilangkan kuning sol", price: 30000 },
  { name: "Premium Suede", description: "Perawatan suede premium", price: 65000 },
  { name: "Repaint", description: "Cat ulang full sepatu", price: 125000 },
  { name: "Repair", description: "Perbaikan (harga bervariasi)", price: 40000 },
  { name: "Fast Wash", description: "Cuci kilat 1 hari jadi", price: 50000 }
]

services.each do |s|
  Service.find_or_create_by!(name: s[:name]) do |service|
    service.description = s[:description]
    service.price = s[:price]
  end
end

# -----------------------------
# Laundry Orders
# -----------------------------
# Contoh order: harga total = harga sepatu + harga service
def create_order(customer_name, shoe_brand, service_name, status="Proses")
  customer = Customer.find_by(name: customer_name)
  shoe = Shoe.find_by(brand: shoe_brand)
  service = Service.find_by(name: service_name)

  total_price = (shoe&.price || 0) + (service&.price || 0)

  Order.find_or_create_by!(customer: customer, shoe: shoe, service: service) do |o|
    o.status = status
    o.total_price = total_price
  end
end

create_order("Toby", "Sepatu Kecil", "Easy Wash")
create_order("Toby", "Sepatu Sedang", "Repaint", "Selesai")
create_order("Budi", "Sepatu Besar", "Repair")
