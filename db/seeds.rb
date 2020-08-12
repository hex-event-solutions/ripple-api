# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).

tmpl_header = Setting.create!(name: 'Document header')
tmpl_footer = Setting.create!(name: 'Document footer')
tmpl_styles = Setting.create!(name: 'Document styles')
asset_barcode = Setting.create!(name: 'Asset barcode pattern')
asset_case_barcode = Setting.create!(name: 'Asset case barcode pattern')

## Start of test data

hex = Company.create!(
  id: 'bf95a575-ebcc-4a6d-9955-4dc6892f9884',
  name: 'Hex Event Solutions Limited',
  short_name: 'Hex',
  company_number: '11299813',
  address1: '72 Grove Road',
  city: 'Chichester',
  county: 'West Sussex',
  postcode: 'PO18 8AP',
  phone_number: '07817 026962',
  logo: 'https://hexes.co.uk/static/media/logo-dark.d8361f0c.png',
  domain: 'hexes.co.uk'
)
CompanySetting.create!(
  company: hex,
  setting: asset_barcode,
  value: 'A(000000)'
)
CompanySetting.create!(
  company: hex,
  setting: asset_case_barcode,
  value: 'C(000000)'
)
CompanySetting.create!(
  company: hex,
  setting: tmpl_header,
  value: %{
    <div class='top-triangle'></div>
    <div class='container-fluid p-3'>
      <div class='row pb-3'>
        <div class='col text-right'>
          {{#company}}
            {{#logo}}<img src={{logo}} class='logo' />{{/logo}}
          {{/company}}
        </div>
      </div>
    </div>
  }
)
CompanySetting.create!(
  company: hex,
  setting: tmpl_footer,
  value: %{
    <div class='bottom-triangle'></div>
    <div class='container-fluid pt-5'>
      <div class='row pt-3 pl-3'>
        <div class='col'>
          <span class="page"></span>
        </div>
      </div>
    </div>
  }
)
CompanySetting.create!(
  company: hex,
  setting: tmpl_styles,
  value: File.read('db/seeds/company_settings/styles.css')
)

quote = DocumentType.create!(
  company: hex,
  name: 'Quote',
  subject: 'Event',
  content: File.read('db/seeds/document_types/quote.yml'),
  increment_pattern: '(0000)',
  incremental: true,
  date_issued: true
)
invoice = DocumentType.create!(
  company: hex,
  name: 'Invoice',
  subject: 'Event',
  content: File.read('db/seeds/document_types/invoice.yml'),
  increment_pattern: '(0000)',
  incremental: true,
  date_issued: true,
  date_due: true
)
asset_list = DocumentType.create!(
  company: hex,
  name: 'Asset list',
  subject: 'AssetType',
  content: File.read('db/seeds/document_types/asset_list.yml')
)
pat_report = DocumentType.create!(
  company: hex,
  name: 'PAT Report',
  subject: 'Event',
  styles: %{
    p {
      margin: 0;
    }

    .no-breaks {
      white-space: pre-wrap;
    }
  },
  content: %(
    <div class='container-fluid p-5'>
      <div class='row pb-3'>
        <div class='col'>
          {{#client}}
            {{#organisation_name}}<p><b>{{organisation_name}}</b></p>{{/organisation_name}}
            {{#address}}<p class='no-breaks'>{{address}}</p>{{/address}}
          {{/client}}
        </div>
        <div class='col text-right'>
          {{#company}}
            <p><b>{{name}}</b></p>
            <p class='no-breaks'>{{address}}</p>
          {{/company}}
        </div>
      </div>
      <div class='row pt-5 pb-3'>
        <div class='col'>
          <table class='table text-left'>
            <thead>
              <tr>
                <th>Item</th>
                <th>Quantity</th>
              </tr>
            </thead>
            <tbody>
              {{#bare_items}}
                <tr>
                  <td><p>{{name}}</p></td>
                  <td>{{quantity}}</td>
                </tr>
              {{/items}}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
)
pick_list = DocumentType.create!(
  company: hex,
  name: 'Pick List',
  subject: 'Event',
  content: %{
    <div class='container-fluid p-5'>
      <div class='row pb-3'>
        <div class='col'>
          {{#client}}
            {{#organisation_name}}<p><b>{{organisation_name}}</b></p>{{/organisation_name}}
            {{#address}}<p class='no-breaks'>{{address}}</p>{{/address}}
          {{/client}}
        </div>
        <div class='col text-right'>
          {{#company}}
            <p><b>{{name}}</b></p>
            <p class='no-breaks'>{{address}}</p>
          {{/company}}
        </div>
      </div>
      <div class='row pt-5 pb-3'>
        <div class='col'>
          <table class='table text-left'>
            <thead>
              <tr>
                <th>Item</th>
                <th>Quantity</th>
              </tr>
            </thead>
            <tbody>
              {{#bare_items}}
                <tr>
                  <td><p>{{name}}</p></td>
                  <td>{{quantity}}</td>
                </tr>
              {{/bare_items}}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  }
)
maintenance_history = DocumentType.create!(
  company: hex,
  name: 'Maintenance History',
  subject: 'Asset',
  content: File.read('db/seeds/document_types/maintenance_history.yml')
)

sound = Category.create!(company: hex, name: 'Sound')
active_speakers = Category.create!(company: hex, name: 'Active Speakers', parent: sound)
stage_monitors = Category.create!(company: hex, name: 'Stage Monitors', parent: sound)

cables_image = Image.create!(id: 'c5d2cd65-f69f-4c6f-b6bd-51dba7c34d90', company: hex)
cables_image.file.attach(io: File.open('db/seeds/images/cable.png'), filename: 'Cable.png')
cables = Category.create!(company: hex, name: 'Cables')
xlr = Category.create!(company: hex, name: 'XLR', parent: cables)

ResourceImage.create!(company: hex, resource: cables, image: cables_image)
ResourceImage.create!(company: hex, resource: xlr, image: cables_image)

speaker_image = Image.create!(id: '386d09ca-a72d-4b18-9e1e-b80099b3dfb2', company: hex)
speaker_image.file.attach(io: File.open('db/seeds/images/speaker.png'), filename: 'Speaker.png')
speaker = AssetType.create!(
  company: hex,
  cost: 150,
  rate: 5,
  manufacturer: 't.box',
  model: 'PA110a',
  weight: 10,
  description: '180w active 2 way speaker',
  display_on_website: true
)
cable = AssetType.create!(
  company: hex,
  cost: 9,
  rate: 0.5,
  manufacturer: 'Hex',
  model: '5m XLR',
  weight: 0.25,
  description: '5m XLR',
  display_on_website: true
)
mic = AssetType.create!(
  company: hex,
  cost: 38,
  rate: 3,
  manufacturer: 't.bone',
  model: 'MB85',
  weight: 1,
  display_on_website: false
)

x32_pkg = AssetType.create!(
  company: hex,
  cost: 0,
  rate: 110.0,
  manufacturer: 'Hex',
  model: 'X32 with S32',
  weight: 0,
  display_on_website: true
)
x32 = AssetType.create!(
  company: hex,
  cost: 1550,
  rate: 90.0,
  manufacturer: 'Behringer',
  model: 'X32',
  weight: 44.3,
  display_on_website: true
)
s32 = AssetType.create!(
  company: hex,
  cost: 720,
  rate: 35.0,
  manufacturer: 'Behringer',
  model: 'S32',
  weight: 13.5,
  display_on_website: true
)
desk_light = AssetType.create!(
  company: hex,
  cost: 15,
  rate: 1.0,
  manufacturer: 'Adam Hall',
  model: 'SLED 1 Ultra',
  weight: 0.2,
  display_on_website: true
)

daily = MultiplierType.find_by(company: hex, name: 'Daily')
shortweekly = MultiplierType.find_by(company: hex, name: 'Shortweekly')

AssetTypeMultiplierType.create!(company: hex, asset_type: speaker, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: speaker, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: cable, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: cable, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: mic, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: x32_pkg, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: x32_pkg, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: x32, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: x32, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: s32, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: s32, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: desk_light, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: desk_light, multiplier_type: shortweekly)

ResourceImage.create!(company: hex, resource: speaker, image: speaker_image)
ResourceImage.create!(company: hex, resource: cable, image: cables_image)

AssetTypeCategory.create!(company: hex, asset_type: speaker, category: active_speakers)
AssetTypeCategory.create!(company: hex, asset_type: speaker, category: stage_monitors)
AssetTypeCategory.create!(company: hex, asset_type: cable, category: xlr)
AssetTypeCategory.create!(company: hex, asset_type: mic, category: sound)
AssetTypeCategory.create!(company: hex, asset_type: x32_pkg, category: sound)
AssetTypeCategory.create!(company: hex, asset_type: x32, category: sound)
AssetTypeCategory.create!(company: hex, asset_type: s32, category: sound)
AssetTypeCategory.create!(company: hex, asset_type: desk_light, category: sound)

Accessory.create!(company: hex, asset_type: speaker, accessory: cable, quantity: 1)
Accessory.create!(company: hex, asset_type: x32_pkg, accessory: x32, quantity: 1)
Accessory.create!(company: hex, asset_type: x32_pkg, accessory: s32, quantity: 1)
Accessory.create!(company: hex, asset_type: x32, accessory: desk_light, quantity: 1)

asset_case = AssetCase.create!(company: hex)

asset = Asset.create!(company: hex, asset_type: speaker, asset_case: asset_case)

charity = ClientType.find_by!(company: hex, name: 'Charity')
asu = Client.create!(
  company: hex,
  organisation_name: "Aston Students' Union",
  address1: '8 Coleshill Street',
  city: 'Birmingham',
  postcode: 'B4 7BX',
  discount: 0,
  client_type: charity
)

Contact.create!(company: hex, client: asu, name: 'Nadine')

event = Event.create!(
  company: hex,
  client: asu,
  date_start: Time.now + 1.minute,
  date_out: Time.now,
  date_return: Time.now + 3.minutes,
  date_end: Time.now + 2.minutes,
  description: 'Gradball',
  location: 'TBC'
)

Shift.create!(
  company: hex,
  event: event,
  crew_id: '63784d7a-2291-4d1d-8963-c622120d5b1d',
  start: Time.now,
  finish: Time.now + 1.hours,
  rate: 9,
  price: 12
)

EventItem.create!(company: hex, event: event, item: asset)
EventItem.create!(company: hex, event: event, item: speaker, quantity: 1, discount: 0)
EventItem.create!(company: hex, event: event, item: cable, quantity: 3, discount: 0)
EventItem.create!(company: hex, event: event, item: mic, quantity: 5, discount: 20)
EventItem.create!(company: hex, event: event, item: x32_pkg, quantity: 1, discount: 0)

color = Specification.create!(company: hex, name: 'Color')

AssetTypeSpecification.create!(company: hex, asset_type: speaker, specification: color, value: 'Black')

doc = Document.create!(
  company: hex,
  subject_id: event.id,
  document_type: invoice,
  reference: '00097',
  date_issued: 2.weeks.ago,
  date_due: 2.weeks.from_now
)
Document.create!(
  company: hex,
  subject_id: event.id,
  document_type: quote,
  reference: '00055',
  date_issued: 2.weeks.ago,
  date_due: 2.weeks.from_now
)
Document.create!(company: hex, subject_id: event.id, document_type: pat_report)
Document.create!(company: hex, subject_id: event.id, document_type: pick_list)
Document.create!(company: hex, subject_id: asset.id, document_type: maintenance_history)

other_item = RowItem.create!(company: hex, price: 15, description: 'Confetti cannon')

DocumentStateEvent.create!(
  company: hex,
  document: doc,
  document_state: DocumentState.find_by!(company: hex, name: 'Sent')
)
DocumentStateEvent.create!(
  company: hex,
  document: doc,
  document_state: DocumentState.find_by!(company: hex, name: 'Overdue')
)

schedule = MaintenanceSchedule.create!(
  company: hex,
  asset_type: speaker,
  maintenance_type: MaintenanceType.find_by!(company: hex, name: 'PAT'),
  repeat_multiplier: 1,
  repeat_period: 'year'
)

MaintenanceEvent.create!(
  company: hex,
  maintenance_schedule: schedule,
  maintenance_resolution: MaintenanceResolution.find_by!(company: hex, name: 'Maintenance completed'),
  asset: asset
)

website = Website.create!(
  company: hex,
  styles: %{
@import url('https://fonts.googleapis.com/css?family=Raleway|Muli&display=swap');

:root {
  --text-color: #3c4858;
  --navbar-height: 100px;
}

body {
  margin: 0;
  padding: 0;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: var(--text-color);
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}

.main-content {
  min-height: calc(100vh - var(--navbar-height));
}

.full-height {
  height: 100vh;
}

.half-height {
  height: 50vh;
}

.two-third-height {
  height: 70vh;
}

.third-height {
  height: 30vh;
}

.auto-height {
  height: auto;
}

.header-height {
  height: calc(30vh + var(--navbar-height));
}

.big-image {
  height: 100%;
  width: 100vw;
}

.header-image {
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://hexes.co.uk/static/media/pageheader.c738b0c9.jpg);
  background-position: center;
  background-size: cover;
}

.home-image {
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://hexes.co.uk/static/media/homebackground.b06c54cd.png);
  background-position: center;
  background-size: cover;
}

.event-image {
  background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url(https://hexes.co.uk/static/media/homeevent.98f9bdb6.jpg);
  background-position: center;
  background-size: cover;
}

.event2-image {
  background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)), url(https://hexes.co.uk/static/media/homeevent2.87524245.jpg);
  background-position: center;
  background-size: cover;
}

.contact-image {
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://hexes.co.uk/static/media/homecontact.aa8e39a1.jpg);
  background-position: center;
  background-size: cover;
}

.nav-image {
  height: 65px !important;
  width: auto;
}

.padding-center {
  padding-top: calc(50vh - 100px);
}

@media only screen and (max-width: 768px) {
  .padding-center {
    padding-top: 50%;
  }
}

.padding-center-header {
  padding-top: calc(12vh + (calc(var(--navbar-height) / 2)));
}

.pt-10 {
  padding-top:10vh
}

.py-10 {
  padding-top: 10vh;
  padding-bottom: 10vh;
}

.white {
  color: white;
}

p, div {
  font-family: "Muli", "Helvetica", "Arial", sans-serif;
}

h1, h2, h3, h4, h5, h6, .nav-link {
  font-family: "Raleway", "Helvetica", "Arial", sans-serif;
}

.navbar-dark {
  /* background-color: rgba(255, 255, 255, 0.15); */
  background-color: transparent;
}

.navbar-light {
  /* background-color: rgba(0, 0, 0, 0.15); */
  background-color: white;
}

.hidden-navbar-light {
  display: none;
}

.hidden-navbar-dark {
  display: none;
}

.navbar {
  min-height: var(--navbar-height);
}

.nav-link .active {
  border-bottom-color: white;
  border-bottom-width: 3px;
}

.nav-link {
  font-weight: bold;
}

.card-link {
  color: var(--text-color)
}

.card-row {
  display: flex;
  flex-wrap: wrap;
}

.card-row > div[class*='col-'] {
  display: flex;
}

.card-img-equal {
  width: auto;
  max-height: 300px;
  padding: 10px;
}

.card-img-equal-container {
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
}

.bg-dark {
  background-color: rgba(20, 23, 25, 0.8) !important;
}
  },
  template: %{
id: bf95a575-ebcc-4a6d-9955-4dc6892f9884
header:
  brand:
    image: https://hexes.co.uk/static/media/logo-light.1f72cb05.png
    link: /home
    alt: Hex Event Solutions Limited
  content:
  - link: HOME
    destination: /home
  - link: WHO ARE WE
    destination: /who-are-we
  - ripple: HIRE
  - link: OUR WORK
    destination: /home#our-work
  - dropdown: WHAT WE'VE BEEN UP TO
    content:
      - link: Grand Gospel 2018
        destination: /grand-gospel-2018
      - link: Grand Gospel 2018
        destination: /grand-gospel-2018
  - link: GET IN TOUCH
    destination: /home#get-in-touch
footer:
  content:
  - link: Legal
    destination: /legal
  - link: Terms and Conditions
    destination: /terms-and-conditions
pages:
- name: Home
  paths:
  - /
  - /home
  type: static
  content:
  - type: jumbotron
    heading: Sound Lighting Rigging Staging Power Crew
    subheading: Whatever your needs, we've got you covered
    button:
      style: primary
      text: See what we can do
      link: /home#get-in-touch
  - type: cards
    content:
    - icon: briefcase
      heading: Experienced
      text: Having worked on a range of events from small busking gigs to festival stages, we have the skills to make your event the best it can be
    - icon: user-tie
      heading: Qualified
      text: Every one of our crew members is fully trained in both technical services and Health and Safety, so you can be sure your event is in good hands
    - icon: comments
      heading: There when you need us
      text: Let us create your perfect event, working with you at every stage of your planning from inception to show day
  - type: image
    height: two-third
    image: event-image
  - type: grid
    heading: We've got you covered
    subheading: Whether you need a small PA or full festival rig, we can help
    content:
    - heading: Lighting
      text: Our lighting inventory is built from the ground up with industry standard kit, alongside our own custom equipment to give every event a unique experience
    - heading: Sound
      text: We have a huge range of sound equipment available from manufacturers such as Nexo, Logic Systems, Pioneer, Allen&Heath and Shure, allowing a perfect match to be found for your requirements
    - heading: Power
      text: All of our power equipment is manufactured in-house to our exacting standards, and then tested for safety for your peace of mind
    - heading: Crew
      text: Every member of our crew is trained with a number of H&S certifications, as well as a vast supply of training direct from manufacturers
  - type: image
    height: two-third
    image: event2-image
  - type: portfolio
    heading: Our work
    subheading: Take a look at what we've been doing recently
    anchor: our-work
    content:
    - type: image-card
      image: https://hexes.co.uk/static/media/header.9236708f.jpg
      heading: Aston AU Ball
      text: Sound, lighting, rigging, power, crew
      subtext: 1st February 2020
    - type: image-card
      image: https://hexes.co.uk/static/media/header.adb37aa9.jpg
      heading: The Long Road
      text: Stage manager
      subtext: 6th - 8th September 2019
    - type: image-card
      image: https://hexes.co.uk/static/media/header.c738b0c9.jpg
      heading: Creamfields
      text: Stage manager
      subtext: 21st - 25th August
    - type: image-card
      image: https://hexes.co.uk/static/media/header.081b1400.jpg
      heading: Cross The Tracks & Mighty Hoopla
      text: Stage manager
      subtext: 8th - 9th June 2019
    - type: image-card
      image: https://hexes.co.uk/static/media/header.30506799.jpg
      heading: Aston Gradball
      text: Sound, lighting, rigging, power, crew
      subtext: 25th May 2019
    - type: image-card
      image: https://hexes.co.uk/static/media/header.650f9271.jpg
      heading: Aston Take Me Out
      text: Sound lighting, power, crew
      subtext: 12th February 2019
    - type: image-card
      image: https://hexes.co.uk/static/media/header.1555f89d.jpg
      heading: Aston AU Ball
      text: Sound, lighting, rigging, power, crew
      subtext: 9th February 2019
    - type: image-card
      image: https://hexes.co.uk/static/media/header.b741bcd6.jpg
      heading: Birmingham Swing Exchange
      text: Sound, lighting, rigging, power, crew
      subtext: 1st - 3rd February 2019
    - type: image-card
      image: https://hexes.co.uk/static/media/header.1dac14f3.jpg
      heading: Beatz Fitness
      text: Sound, lighting, power, crew
      subtext: 24th November 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.a1e78093.jpg
      heading: Aston Freshers Week
      text: Sound, lighting, rigging, staging, power, crew
      subtext: 15th & 22nd September 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.57632eee.jpg
      heading: The Long Road
      text: Stage manager
      subtext: 7th - 9th September 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.33652c31.jpg
      heading: Creamfields
      text: Stage manager
      subtext: 22nd - 26th August 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.87524245.jpg
      heading: Aston Gradball
      text: Sound, lighting, rigging, power, crew
      subtext: 2nd June 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.4451a62d.jpg
      heading: The Last Hurrah
      text: Sound, lighting, rigging, power, crew
      subtext: 5th May 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.5c8d5269.jpg
      heading: 12 Hours of Dance
      text: Sound, lighting, rigging, power, crew
      subtext: 24th March 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.7371412a.jpg
      heading: Grand Gospel
      text: Sound, lighting, rigging, power, crew
      subtext: 23rd February 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.a05d0660.jpg
      heading: Aston AU Ball
      text: Sound, lighting, rigging, power, crew
      subtext: 27th January 2018
    - type: image-card
      image: https://hexes.co.uk/static/media/header.11a51b55.jpg
      heading: Birmingham Swing Exchange
      text: Sound, lighting, rigging, power, crew
      subtext: 17th - 19th November 2017
    - type: image-card
      image: https://hexes.co.uk/static/media/header.98f9bdb6.jpg
      heading: Aston Freshers Week
      text: Sound, lighting, rigging, staging, power, crew
      subtext: 16th - 24th September 2017
    - type: image-card
      image: https://hexes.co.uk/static/media/header.73eb549b.jpg
      heading: Lucha Forever
      text: Sound, lighting, rigging, staging, power, crew
      subtext: 14th July 2017
  - type: contact
    image:
    heading: Get in touch
    subheading: See how we can make your dream event become a reality
    anchor: get-in-touch
    mobile: 07817 026962
    email: hire@hexes.co.uk
- name: Who Are We
  paths:
  - /who-are-we
  type: static
  content:
  - type: block
    content:
    - heading: Let us introduce ourselves
    - paragraph: We are a passionate and experienced group of technicians based in Birmingham and West Sussex, covering the Midlands, Surrey, Hampshire, London and most of the South Coast.
    - paragraph: We create bespoke events for every client, designing every aspect to best suit the style and audience. From initial design right through to keeping the stage clean during the event, we have an eye for detail that can transform your idea into a reality.
    - paragraph: All our crew are trained on industry standard equipment by leading manufacturers as well as carrying standard Health and Safety qualifications. Every member is insured for live events, ensuring your complete peace of mind when working with us.
- name: Hire
  paths:
  - /hire
  type: ripple
- name: Legal
  paths:
  - /legal
  type: static
  content:
  - type: block
    content:
      - heading: Copyrights
      - paragraph: The Facebook logo, and all respective references and trademarks are property of Facebook. Stock photos, where used, are used in accordance with the owner’s policies, and are not to be copied, altered or redistributed outside of acceptable use, defined in the owner’s policy. This site remains property of Hex Event Solutions Limited.
- name: Terms and Conditions
  paths:
  - /terms-and-conditions
  type: static
  content:
  - type: block
    content:
    - paragraph: All events are subject to the below terms and conditions.
    - separator: true
    - heading: Payment
    - paragraph: An estimate of the final charge will be provided when you book an event with us. At the end of an event, you will receive an invoice, with the exact final charge. This is due no later than 30 days from the end of an event. By continuing with your booking, you agree that in the event of non-payment, we will take appropriate action to retrieve the outstanding amount from you.
    - paragraph: Every event is subject to a 20% non-refundable deposit, based on your quotation amount, to confirm your event.
    - separator: true
    - heading: Cancellation Procedure
    - subheading: Very short notice cancellation – less than 24 hours’ notice
    - paragraph: We will require payment in full according to the initial quote you received. This is to cover crew, planning time and hired equipment if required.
    - subheading: Short notice cancellation – less than 48 hours' notice
    - paragraph: We will require payment of hire equipment only.
    - separator: true
    - heading: Booking Procedure
    - paragraph: To book an event, we require some information about your plan from you, please contact hire@hexes.co.uk.
    - separator: true
    - heading: Transport
    - paragraph: Any transport or accommodation required by the crew or equipment will be added on to the final total to be paid. An estimate will be given with each quote, but the value given in the invoice is the amount due.
    - separator: true
    - heading: Security
    - paragraph: Vehicles and equipment must be kept in a secure location; therefore, each event will need a visit to the proposed venue if we have not held an event there before. This is to ensure our requirements are met with no surprises on the day.
    - separator: true
    - heading: Equipment
    - paragraph: Should our equipment be damaged, lost or stolen during an event and outside of the fault of the crew, any repair, replacement costs and/or hire costs in the period before repair shall be paid by the event organiser. In the case of theft, the cost of replacement will be passed on to the event organiser and the event organiser shall be reported to the appropriate authorities.
  }
)

WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'block',
  component_type: 'component',
  template: %{
    <div class='pt-4 text-left'>
      {{#width}}<div class='col-sm-{{width}}'>{{/width}}
      {{^width}}<div class='col-sm-12'>{{/width}}
        {{#content}}
          {{#paragraph}}
            <p>{{paragraph}}</p>
          {{/paragraph}}
          {{#heading}}
            <h3>{{heading}}</h3>
          {{/heading}}
          {{#subheading}}
            <h4>{{subheading}}</h4>
          {{/subheading}}
          {{#separator}}
            <hr />
          {{/separator}}
        {{/content}}
      </div>
    </div>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'cards',
  component_type: 'component',
  template: %{
    <section class='row pt-10'>
      <div class='col-md-8 offset-md-2'>
        <div class='container'>
          <div class='row'>
            {{#content}}
              <div class='col-md-4'>
                <i class='fas fa-{{icon}} fa-6x'></i>
                <h3 class='py-3'>{{heading}}</h3>
                <h5>{{text}}</h5>
              </div>
            {{/content}}
          </div>
        </div>
      </div>
    </section>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'contact',
  component_type: 'component',
  template: %{
    <section class='row pt-10' id={{anchor}}>
      <div class='big-image contact-image'>
        <div class='container-fluid'>
          <div class='row'>
            <div class='col-sm-12 pt-10'><h1 class='white'>{{heading}}</h1></div>
            <div class='col-sm-12'><h4 class='white'>{{subheading}}</h4></div>
            <div class='col-md-12 hidden-sm pt-10'></div>
            <div class='col-md-6'><h4 class='white'>Mobile: {{mobile}}</h4></div>
            <div class='col-md-6'><h4 class='white'>Email: {{email}}</h4></div>
            <div class='col-md-12 hidden-sm pt-10'></div>
          </div>
        </div>
      </div>
    </section>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'footer',
  component_type: 'component',
  template: %{
    <nav class='navbar navbar-expand-sm navbar-light'>
      <ul class='navbar-nav'>
        {{#content}}
          {{#link}}
            <li class='nav-item px-2'><a class='nav-link' href='{{destination}}'>{{link}}</a></li>
          {{/link}}
        {{/content}}
      </ul>
    </nav>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'grid',
  component_type: 'component',
  template: %{
    <section class='row pt-10'>
      <div class='col-sm-12'><h1>{{heading}}</h1></div>
      <div class='col-sm-12 pb-3'><h5>{{subheading}}</h5></div>
      <div class='col-md-12 col-xl-8 offset-xl-2 pt-3'>
        <div class='container-fluid'>
          <div class='row'>
            {{#content}}
              <div class='col-sm-6 pb-3'>
                <div class='card'>
                  <div class='card-body'>
                    <h3 class='card-title'>{{heading}}</h3>
                    <p class='card-text'>{{text}}</p>
                  </div>
                </div>
              </div>
            {{/content}}
          </div>
        </div>
      </div>
    </section>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'header',
  component_type: 'component',
  template: %{
    <nav class='navbar navbar-expand-lg border-bottom fixed-top navbar-dark text-light bg-dark'>
      <a class='navbar-brand' href='{{brand.link}}'>
        <img class='img-fluid nav-image pl-3' src='{{brand.image}}' alt='{{brand.alt}}' />
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon" />
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          {{#content}}
            {{#link}}
              <li class='nav-item px-2'><a class='nav-link' href='{{destination}}'>{{link}}</a></li>
            {{/link}}
            {{#dropdown}}
              <li class='nav-item px-2 dropdown'>
                <a class='nav-link dropdown-toggle' href='#' role='button' aria-haspopup='true' aria-expanded='false'>{{dropdown}}</a>
                <div class='dropdown-menu'>
                  {{#content}}
                    {{#link}}
                      <a class='dropdown-item' href='{{destination}}'>{{link}}</a>
                    {{/link}}
                  {{/content}}
                </div>
              </li>
            {{/dropdown}}
          {{/content}}
        </ul>
      </div>
    </nav>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'heading',
  component_type: 'component',
  template: %{
    <h1>{{text}}</h1>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'image',
  component_type: 'component',
  template: %{
    <section class='row pt-10 {{height}}-height'>
      <div class='big-image {{image}}'></div>
    </section>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'jumbotron',
  component_type: 'component',
  template: %{
    <section class='row full-height'>
      <div class='big-image home-image'>
        <div class='padding-center'>
          <h1 class='white display-3 pb-3'>{{heading}}</h1>
          <h3 class='white pb-3'>{{subheading}}</h3>
          {{#button}}
            <a href='{{link}}' class='btn btn-{{style}}'>{{text}}</a>
          {{/button}}
        </div>
      </div>
    </section>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'page-header',
  component_type: 'component',
  template: %{
    <section class='row header-height text-center'>
      <div class='big-image header-image'>
        <div class='padding-center-header'>
          <h1 class='white display-4'>{{heading}}</h1>
          {{#subheading}}<h4 class='white'>{{subheading}}</h4>{{/subheading}}
        </div>
      </div>
    </section>
  }
)
WebsiteComponent.create!(
  company: hex,
  website: website,
  name: 'portfolio',
  component_type: 'component',
  template: %{
    <section class='row pt-10' id='{{anchor}}'>
      <div class='col-sm-12'><h1>{{heading}}</h1></div>
      <div class='col-sm-12'><h5>{{subheading}}</h5></div>
    </section>
    <section class='row card-row auto-height pt-3'>
      {{#content}}
        <div class='col-md-4'>
          <a class='card-link card mb-3' href={{link}}>
            <img class='card-img-top' src={{image}} />
            <div class='card-body'>
              <h3 class='card-title'>{{heading}}</h3>
              <p class='card-text'>{{text}}</p>
              <p class='card-text text-muted'>{{subtext}}</p>
            </div>
          </a>
        </div>
      {{/content}}
    </section>
  }
)
