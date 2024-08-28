file = File.open('db/data.json').read
JSON.parse(file).each do |phase_object|
  phase_properties = phase_object['properties']

  messages = phase_properties['Notif description']['rollup']['array'].map { |x| x['rich_text'].first['plain_text'] }
  ph = Phase.create!(name: phase_properties['phase_name']['title'].first['plain_text'],
                     end: phase_properties['end']['number'], start: phase_properties['start']['number'], is_first_cycle_logged: phase_properties['is_first_cycle_logged']['checkbox'])
  Notification.create!(messages: messages, priority: phase_properties['priority'].try(:[], 'number'), phase_id: ph.id,
                       moment: Notification.get_moment(phase_properties['moment']['select'].try(:[], 'name')))
end
