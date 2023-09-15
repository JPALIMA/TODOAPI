class TasksController < ApplicatioController
     def index
          tasks = Task.all
          render json: tasks
     end

     def show
          task = Task.find(params[:id])
          render json: tasks
     end

     def create
          task = Task.new(task_params)
          if task.save
               render json:task, status: :created
          else
               render json: task.errors, status: :unprocessable_entity
          end
     end

     def update
          task = Task.find(params[:d])
          if task.update(task_params)
               render json: task
          else
               render json: task.errors, status: :unprocessable_entity
          end
     end

     def destroy
          task = Task.find(params[:id])
          task.destroy
          head :no_content
     end

     private

     def task.params
          params.require(:task).permit(:title, :completed)
     end
end

