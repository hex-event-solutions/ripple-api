# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

hex = Company.create!(
  id: 'bf95a575-ebcc-4a6d-9955-4dc6892f9884',
  name: 'Hex Event Solutions Limited',
  company_number: '11299813',
  address1: '72 Grove Road',
  city: 'Chichester',
  county: 'West Sussex',
  postcode: 'PO18 8AP',
  phone_number: '07817 026962',
  logo: 'https://hexes.co.uk/static/media/logo-dark.d8361f0c.png',
  domain: 'hexes.co.uk'
)

individual = ClientType.create!(company: hex, name: 'Individual')
company = ClientType.create!(company: hex, name: 'Company')
charity = ClientType.create!(company: hex, name: 'Charity')

daily = MultiplierType.create!(company: hex, name: 'Daily', multiplier: 1, multiplier_type: 'day', operand_quantity: 1, operand_type: 'day')
shortweekly = MultiplierType.create!(company: hex, name: 'Shortweekly', multiplier: 3, multiplier_type: 'day', operand_quantity: 7, operand_type: 'day')

mt_pat = MaintenanceType.create!(company: hex, name: 'PAT Test')
mt_investigative = MaintenanceType.create!(company: hex, name: 'Investigative')
mt_preventative = MaintenanceType.create!(company: hex, name: 'Preventative')
mt_repair = MaintenanceType.create!(company: hex, name: 'Repair')

mr_disposed = MaintenanceResolution.create!(company: hex, name: 'Asset disposed of')
mr_inspection = MaintenanceResolution.create!(company: hex, name: 'Asset under inspection')
mr_complete = MaintenanceResolution.create!(company: hex, name: 'Maintenance completed')
mr_will_not_repair = MaintenanceResolution.create!(company: hex, name: 'Asset will not be repaired')

draft = DocumentState.create!(company: hex, name: 'Draft')
sent = DocumentState.create!(company: hex, name: 'Sent')
overdue = DocumentState.create!(company: hex, name: 'Overdue')
expired = DocumentState.create!(company: hex, name: 'Expired')
invoiced = DocumentState.create!(company: hex, name: 'Invoiced')
paid = DocumentState.create!(company: hex, name: 'Paid')

quote = DocumentType.create!(company: hex, name: 'Quote', subject: 'Event', template: '{{field}}')
invoice = DocumentType.create!(
  company: hex,
  name: 'Invoice',
  subject: 'Event',
  styles: %{
    @import url('https://fonts.googleapis.com/css?family=Raleway|Muli&display=swap');

    p, div {
      font-family: "Muli", "Helvetica", "Arial", sans-serif;
    }

    h1, h3, h4, h4, h5, h6, .nav-link {
      font-family: "Raleway", "Helvetica", "Arial", sans-serif;
    }

    p {
      margin: 0;
    }

    .no-breaks {
      white-space: pre-wrap;
    }

    .logo {
      width: 200px;
    }
  },
  template: %(
    <div class='container-fluid'>
      {{#company}}
        <div class='row'>
          <div class='col-7'>
            {{#logo}}<img src={{logo}} class='logo' />{{/logo}}
          </div>
          <div class='col-5'>
            <p><b>{{name}}</b></p>
            <p class='no-breaks'>{{address}}</p>
          </div>
        </div>
      {{/company}}
      <div class='row py-3'>
        <div class='col-7'>
          {{#client}}
            {{#organisation_name}}<p><b>{{organisation_name}}</b></p>{{/organisation_name}}
            {{#address}}<p class='no-breaks'>{{address}}</p>{{/address}}
          {{/client}}
        </div>
        <div class='col-5'>
          {{#document}}
            {{#number}}<h3>Invoice {{number}}</h3>{{/number}}
            {{#date_issued}}<p><b>Issued:</b> {{display_date_issued}}</p>{{/date_issued}}
            {{#date_due}}<p><b>Due:</b> {{display_date_due}}</p>{{/date_due}}
          {{/document}}
          {{#date_out}}<p><b>Out:</b> {{display_date_out}}</p>{{/date_out}}
          {{#date_return}}<p><b>Return:</b> {{display_date_return}}</p>{{/date_return}}
        </div>
      </div>
      <div class='row pt-5 pb-3'>
        <div class='col'>
          <table class='table text-left'>
            <thead>
              <tr>
                <th>Details</th>
                <th>Unit price</th>
                <th>Quantity</th>
                <th>Discount</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              {{#items}}
                <tr>
                  <td>{{description}}</td>
                  <td>{{unit_price}}</td>
                  <td>{{quantity}}</td>
                  <td>{{discount}}</td>
                  <td>{{display_subtotal}}</td>
                </tr>
              {{/items}}
              <tr><td colspan='5'></td></tr>
              <tr>
                <td class='text-right' colspan='4'><b>Grand Total</b></td>
                <td>{{grand_total}}</td>
              </tr>
            </tbody>
          </table>
          {{#asset_types_total_value}}
            <p><b>Total replacement value:</b> {{asset_types_total_value}}</p>
          {{/asset_types_total_value}}
        </div>
      </div>
      <div class='row py-3'>
        <div class='col-6'>
          <h4>Payment Details</h4>
          <p><b>Sort code:</b> 04-00-04</p>
          <p><b>Account number:</b> 1300 2505</p>
          <p><b>Payment reference:</b> 0097</p>
        </div>
        <div class='col-6'>
          <h4>Other Information</h4>
          <p><b>Company number:</b> 11299813</p>
        </div>
      </div>
      <div class='row'><hr /></div>
      <div class='row py-3'>
        <div class='col'>
          <p class='text-muted'>
            If you have any questions or queries regarding your event, please do not hesitate
            to get in contact with us on 07817 026962 or hire@hexes.co.uk.
          </p>
          <p class='text-muted'>
            Continuing with your event booking signifies your agreement to our terms and
            conditions, available at https://hexes.co.uk/hire/terms-and-conditions
          </p>
          <p class='text-muted'>
            If paying by cheque, please make it payable to Hex Event Solutions Limited
          </p>
          <p class='text-muted'>
            Thank you for choosing Hex Event Solutions Limited
          </p>
        </div>
      </div>
    </div>
  )
)
pat_report = DocumentType.create!(
  company: hex,
  name: 'PAT Report',
  subject: 'Event',
  styles: %{
    @import url('https://fonts.googleapis.com/css?family=Raleway|Muli&display=swap');

    p, div {
      font-family: "Muli", "Helvetica", "Arial", sans-serif;
    }

    h1, h3, h4, h4, h5, h6, .nav-link {
      font-family: "Raleway", "Helvetica", "Arial", sans-serif;
    }

    p {
      margin: 0;
    }

    .no-breaks {
      white-space: pre-wrap;
    }

    .logo {
      width: 200px;
    }
  },
  template: %(

  )
)

pick_list = DocumentType.create!(company: hex, name: 'Pick List', subject: 'Event', template: '{{field}}')
mainenance_history = DocumentType.create!(company: hex, name: 'Maintenance History', subject: 'Asset', template: '{{field}}')

DocumentTypeField.create!(company: hex, document_type: quote, name: 'items', property: 'items')
DocumentTypeField.create!(company: hex, document_type: quote, name: 'client', property: 'client')
DocumentTypeField.create!(company: hex, document_type: quote, name: 'company', property: 'company')

sound = Category.create!(company: hex, name: 'Sound')
active_speakers = Category.create!(company: hex, name: 'Active Speakers', parent: sound)
stage_monitors = Category.create!(company: hex, name: 'Stage Monitors', parent: sound)

cables_image = Image.create!(id: 'c5d2cd65-f69f-4c6f-b6bd-51dba7c34d90', company: hex)
cables = Category.create!(company: hex, name: 'Cables')
xlr = Category.create!(company: hex, name: 'XLR', parent: cables)

ResourceImage.create!(company: hex, resource: cables, image: cables_image)
ResourceImage.create!(company: hex, resource: xlr, image: cables_image)

speaker_image = Image.create!(id: '386d09ca-a72d-4b18-9e1e-b80099b3dfb2', company: hex)
speaker = AssetType.create!(company: hex, cost: 150, rate: 5, manufacturer: 't.box', model: 'PA110a', weight: 10, description: '180w active 2 way speaker', display_on_website: true)
cable = AssetType.create!(company: hex, cost: 9, rate: 0.5, manufacturer: 'Hex', model: '5m XLR', weight: 0.25, description: '5m XLR', display_on_website: true)
AssetTypeMultiplierType.create!(company: hex, asset_type: speaker, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: speaker, multiplier_type: shortweekly)
AssetTypeMultiplierType.create!(company: hex, asset_type: cable, multiplier_type: daily)
AssetTypeMultiplierType.create!(company: hex, asset_type: cable, multiplier_type: shortweekly)

ResourceImage.create!(company: hex, resource: speaker, image: speaker_image)
ResourceImage.create!(company: hex, resource: cable, image: cables_image)

AssetTypeCategory.create!(company: hex, asset_type: speaker, category: active_speakers)
AssetTypeCategory.create!(company: hex, asset_type: speaker, category: stage_monitors)
AssetTypeCategory.create!(company: hex, asset_type: cable, category: xlr)

Accessory.create!(company: hex, asset_type: speaker, accessory: cable, quantity: 1)

asset_case = AssetCase.create!(company: hex, barcode: 'C0000001')

asset = Asset.create!(company: hex, asset_type: speaker, asset_case: asset_case, barcode: 'A00000001')

asu = Client.create!(company: hex, organisation_name: 'Aston Students Union', address1: '8 Coleshill Street', city: 'Birmingham', postcode: 'B4 7BX', discount: 0, client_type: charity)

Contact.create!(company: hex, client: asu, name: 'Nadine')

event = Event.create!(company: hex, client: asu, date_start: Time.now, date_out: Time.now + 1.minute, date_return: Time.now + 2.minutes, date_end: Time.now + 3.minutes, description: 'Gradball', location: 'TBC')

ollie = Crew.create!(company: hex, name: 'Ollie Nye', email: 'ollie@hexes.co.uk', password: '1234567890', rate: 9, price: 12)
josh = Crew.create!(company: hex, name: 'Josh Lowe', email: 'josh@hexes.co.uk', password: '1234567890', rate: 9, price: 12)

Shift.create!(company: hex, event: event, crew: ollie, start: Time.now, finish: Time.now + 1.hours, rate: ollie.rate, price: ollie.price)

EventItem.create!(company: hex, event: event, item: asset)
EventItem.create!(company: hex, event: event, item: speaker, quantity: 1, discount: 0)
EventItem.create!(company: hex, event: event, item: cable, quantity: 3, discount: 0)

color = Specification.create!(company: hex, name: 'Color')

AssetTypeSpecification.create!(company: hex, asset_type: speaker, specification: color, value: 'Black')

doc = Document.create!(company: hex, subject_id: event.id, document_type: invoice, number: '00097', date_issued: 2.weeks.ago, date_due: 2.weeks.from_now)

other_item = RowItem.create!(company: hex, price: 15, description: 'Confetti cannon')

DocumentItem.create!(company: hex, document: doc, item: speaker, quantity: 1, discount: 0)
DocumentItem.create!(company: hex, document: doc, item: other_item, quantity: 5, discount: 20)

DocumentStateEvent.create!(company: hex, document: doc, document_state: sent)
DocumentStateEvent.create!(company: hex, document: doc, document_state: overdue)

schedule = MaintenanceSchedule.create!(company: hex, asset_type: speaker, maintenance_type: mt_pat, repeat_multiplier: 1, repeat_period: 'year')

MaintenanceEvent.create!(company: hex, maintenance_schedule: schedule, maintenance_resolution: mr_complete, asset: asset)
