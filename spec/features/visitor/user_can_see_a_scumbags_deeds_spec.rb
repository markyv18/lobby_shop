require "rails_helper"

RSpec.feature "when a user visits a scumbag show page" do
  # As a user when I visit a scumbag show page
  # -I see a list of all the dirty-deeds (aka tags > many-to-many) they have been credited with
  scenario "they can see all the dirty _deeds_ for that scumbag" do
    scumbag = create(:scumbag)
    scumbag.deeds.create!(name:"votes against needs of constituency")
    scumbag.deeds.create!(name:"promotes coal")
    scumbag.deeds.create!(name:"ignores the EPA")
    scumbag.deeds.create!(name:"hates planned parenthood")

    scumbag1 = create(:scumbag)
    scumbag1.deeds.create!(name:"votes against needs of constituency")
    scumbag1.deeds.create!(name:"promotes coal")
    scumbag1.deeds.create!(name:"ignores the EPA")
    scumbag1.deeds.create!(name:"hates planned parenthood")

    visit scumbag_path(scumbag)

    expect(current_path).to eq(scumbag_path(scumbag))
    expect(page).to have_content("Things #{scumbag.name} will do for money: votes against needs of constituency  -  promotes coal  -  ignores the EPA  -  hates planned parenthood ")
    expect(page).to have_content(scumbag.name)

    visit scumbag_path(scumbag1)

    expect(current_path).to eq(scumbag_path(scumbag1))
    expect(page).to have_content("Things #{scumbag1.name} will do for money: votes against needs of constituency  -  promotes coal  -  ignores the EPA  -  hates planned parenthood ")
    expect(page).to have_content(scumbag1.name)

  end

  # -I can see a review for the scumbag.
  # and I see the review's title,
  # and I see the review's body
  scenario "they can see a review of the scumbag" do
    scumbag = create(:scumbag)
    scumbag.deeds.create!(name:"votes against needs of constituency")
    scumbag.reviews.create!(title:"your man for corruption", body:"loves to sell off public property to private interest, if you are looking for a good for nothing piece of shit, this is your guy")

    scumbag1 = create(:scumbag)
    scumbag1.deeds.create!(name:"votes against needs of constituency")
    scumbag1.reviews.create!(title:"the one to always ask how high to jump", body:"loves to sell off public property to private interest, if you are looking for a good for nothing piece of shit, this is your guy")

    visit scumbag_path(scumbag)

    expect(current_path).to eq(scumbag_path(scumbag))

    expect(page).to have_content("What other Lobbyists have thought of #{scumbag.name}")
    expect(page).to have_content("How?: loves to sell off public property to private interest, if you are looking for a good for nothing piece of shit, this is your guy")
    expect(page).to have_content("What?: your man for corruption")
    expect(page).to have_content(scumbag.name)

    visit scumbag_path(scumbag1)

    expect(current_path).to eq(scumbag_path(scumbag1))
    expect(page).to have_content("What other Lobbyists have thought of #{scumbag1.name}")
    expect(page).to have_content("What?: the one to always ask how high to jump")
    expect(page).to have_content("How?: loves to sell off public property to private interest, if you are looking for a good for nothing piece of shit, this is your guy")
    expect(page).to have_content(scumbag1.name)
  end

  scenario "they can see the reviews of the scumbag in order by most recently created" do
    # -I see the reviews in order, the most recent first
    scumbag = create(:scumbag)
    scumbag.deeds.create!(name:"v")
    scumbag.reviews.create!(title:"3rd", body:"3rd")
    scumbag.reviews.create!(title:"2nd", body:"2nd")
    scumbag.reviews.create!(title:"1st", body:"1st")

    visit scumbag_path(scumbag)

    within all("#scumbag-review-details")[2] do
      expect(page).to have_content("1st")
    end
    within all("#scumbag-review-details")[1] do
      expect(page).to have_content("2nd")
    end
    within all("#scumbag-review-details")[0] do
      expect(page).to have_content("3rd")
    end
  end
end
