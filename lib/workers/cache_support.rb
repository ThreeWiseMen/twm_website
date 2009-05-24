class CacheSupport < BackgrounDRb::MetaWorker
  set_worker_name :cache_support
  def create(args = nil)
    add_periodic_timer(3600) { clear_page_caches }
  end

  def clear_page_caches
    logger.info "Clearing page caches"
    Rails.cache.delete "/home/development"
  end
end
