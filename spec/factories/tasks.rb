FactoryBot.define do
  factory :task do
        task_title { 'task1'}
        task_details {'content1'}
      end_date { '1/1/2020' }


    end

    factory :second_task, class: Task do
      task_title { 'task2'}
      task_details {'content2'}
          end_date { '1/3/2020' }

    end
  end
