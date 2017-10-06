ActiveRecord::Base.transaction do
  pp1 = PanelProvider.create!(code: "pp1")
  pp2 = PanelProvider.create!(code: "pp2")
  pp3 = PanelProvider.create!(code: "pp3")

  pl = Country.create!(country_code: "PL", panel_provider: pp1)
  gb = Country.create!(country_code: "GB", panel_provider: pp2)
  rs = Country.create!(country_code: "RS", panel_provider: pp3)

  LocationGroup.create!(name: "Wales", country: gb, panel_provider: gb.panel_provider) do |group|
    group.locations.build %w(
      Bangor
      Cardiff
      Newport
      Swansea
    ).map { |name| { name: name } }
  end

  LocationGroup.create!(name: "Greater Poland", country: pl, panel_provider: pl.panel_provider) do |group|
    group.locations.build [
      "Poznań",
      "Kalisz",
      "Konin",
      "Piła",
      "Ostrów Wielkopolski",
      "Gniezno",
      "Leszno",
    ].map { |name| { name: name } }
  end

  LocationGroup.create!(name: "Pomeranian", country: pl, panel_provider: pl.panel_provider) do |group|
    group.locations.build [
      "Gdańsk",
      "Gdynia",
      "Słupsk",
      "Tczew",
    ].map { |name| { name: name } }
  end

  LocationGroup.create!(name: "Serbia", country: rs, panel_provider: rs.panel_provider) do |group|
    group.locations.build [
      "Beograd",
      "Novi Sad",
      "Niš",
      "Kragujevac",
      "Kraljevo",
    ].map { |name| { name: name } }
  end

  root1 = TargetGroup.create!(name: "Welsh", parent: nil, panel_provider: gb.panel_provider, countries: [gb])
  root2 = TargetGroup.create!(name: "Polish, Greater Poland", parent: nil, panel_provider: pl.panel_provider, countries: [pl])
  root3 = TargetGroup.create!(name: "Polish, Pomeranian", parent: nil, panel_provider: pl.panel_provider, countries: [pl])
  root4 = TargetGroup.create!(name: "Serbian", parent: nil, panel_provider: rs.panel_provider, countries: [rs])

  [root1, root2, root3, root4].each do |root|
    group = root
    3.times do |i|
      group = TargetGroup.create!(name: "Child of Group##{group.id}", parent: group, panel_provider: group.panel_provider, countries: group.countries)
    end
  end
end
