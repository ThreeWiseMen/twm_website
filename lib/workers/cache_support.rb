class CacheSupport < BackgrounDRb::MetaWorker
  set_worker_name :cache_support
  def create(args = nil)
    add_periodic_timer(3600) { clear_page_caches }
  end

  def clear_page_caches
    logger.info "Clearing page caches"
    ActionController::Base.expire_page "/"
    ActionController::Base.expire_page "/home/development"
    ActionController::Base.expire_page "/home/consulting"
    ActionController::Base.expire_page "/home/hosting"
    ActionController::Base.expire_page "/home/success"
    ActionController::Base.expire_page "/home/contact"
    ActionController::Base.expire_page "/home/privacy"
  end
end
