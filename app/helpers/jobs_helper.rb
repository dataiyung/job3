module JobsHelper
  def render_job_status(job)
    if job.is_hidden
       "(隱藏)"
     else
       "(公開)"
     end
   end
end
