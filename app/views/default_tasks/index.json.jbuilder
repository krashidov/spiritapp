json.array!(@default_tasks) do |default_task|
  json.extract! default_task, :id
  json.url default_task_url(default_task, format: :json)
end
