Factory.define :part do |p|
  p.name "TestPart"
  p.description "This is a test part"
  p.jameco_pn 12345678
  p.quantity 100
  p.nominal_quantity 299
end

Factory.define :parts_kit do |p|
  p.name "Test Kit"
end

Factory.define :kit_component do |kc|
  kc.parts_kit_id "1"
  kc.part_id "1"
  kc.part_quantity "1"
end
