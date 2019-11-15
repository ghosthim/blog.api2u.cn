<div class="copyright" >
 
  {% set current = date(Date.now(), "YYYY") %}

  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.authoricon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder"><a href="mailto:{{ config.email }}">{{ config.author }}</a></span>
  
  {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
  {% if theme.creative_commons in cc %}
    <span class="cc-license" itemprop="license">
        <a  style="border:0; margin: 0 5px; position: relative; top: 2px; left: 8px" href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0/cn{% endif %}/" target="_blank" rel="external nofollow">
        <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
        </a>
    </span>
  {% endif %}
   <span class="beian" style="margin-right: 10px;"><a href="http://www.miitbeian.gov.cn/" target="_blank">&nbsp; 鲁ICP备19029601号-2</a></span>
</div>

{% if theme.copyright %}
<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="https://hexo.io">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT.{{ theme.scheme }}
  </a>
</div>
{% endif %}
