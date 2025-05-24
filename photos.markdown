---
layout: page
title: titles.photos
namespace: photos
permalink: /photos/
permalink_fr: /photos/
permalink_nl: /fotos/
---

{% translate_file photos.md %}

{% assign images = site.static_files | where_exp: "file", "file.path contains 'assets/images/'" %}
<ul id="gallery">
  {% for image in images %}
    <img src="{{ site.baseurl }}/{{ image.path }}" alt="{{ image.name }}" class="popup-img" data-index="{{ forloop.index0 }}">
  {% endfor %}
</ul>

<!-- Popup Modal -->
<div id="imgModal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.8); align-items:center; justify-content:center;">
  <span id="closeModal" style="position:absolute; top:20px; right:40px; color:#fff; font-size:40px; cursor:pointer;">&times;</span>
  <button id="prevImg" style="position:absolute; left:20px; top:50%; transform:translateY(-50%); font-size:2em;">&#8592;</button>
  <img id="modalImg" src="" alt="" style="max-width:90vw; max-height:80vh; display:block; margin:auto;">
  <button id="nextImg" style="position:absolute; right:20px; top:50%; transform:translateY(-50%); font-size:2em;">&#8594;</button>
</div>

<script>
  const images = Array.from(document.querySelectorAll('.popup-img'));
  const modal = document.getElementById('imgModal');
  const modalImg = document.getElementById('modalImg');
  const closeModal = document.getElementById('closeModal');
  const prevBtn = document.getElementById('prevImg');
  const nextBtn = document.getElementById('nextImg');
  let currentIndex = 0;

  function showModal(index) {
    currentIndex = index;
    modalImg.src = images[currentIndex].src;
    modal.style.display = 'flex';
  }

  images.forEach((img, idx) => {
    img.addEventListener('click', () => showModal(idx));
  });

  closeModal.onclick = () => { modal.style.display = 'none'; };

  prevBtn.onclick = () => {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    modalImg.src = images[currentIndex].src;
  };

  nextBtn.onclick = () => {
    currentIndex = (currentIndex + 1) % images.length;
    modalImg.src = images[currentIndex].src;
  };

  // Close modal on background click
  modal.onclick = (e) => {
    if (e.target === modal) modal.style.display = 'none';
  };

  // Keyboard navigation
  document.addEventListener('keydown', (e) => {
    if (modal.style.display === 'flex') {
      if (e.key === 'ArrowLeft') prevBtn.onclick();
      if (e.key === 'ArrowRight') nextBtn.onclick();
      if (e.key === 'Escape') closeModal.onclick();
    }
  });
</script>