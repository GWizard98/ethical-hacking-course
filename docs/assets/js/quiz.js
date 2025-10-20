// Simple client-side quiz renderer and grader.
(function () {
  function renderQuiz(container, data) {
    container.innerHTML = '';
    const form = document.createElement('form');
    data.questions.forEach((q, idx) => {
      const field = document.createElement('fieldset');
      const legend = document.createElement('legend');
      legend.textContent = `${idx + 1}) ${q.prompt}`;
      field.appendChild(legend);
      q.options.forEach((opt, oidx) => {
        const id = `q${idx}_o${oidx}`;
        const label = document.createElement('label');
        label.setAttribute('for', id);
        const input = document.createElement('input');
        input.type = q.multi ? 'checkbox' : 'radio';
        input.name = `q${idx}`;
        input.value = String(oidx);
        input.id = id;
        label.appendChild(input);
        label.appendChild(document.createTextNode(' ' + opt));
        const div = document.createElement('div');
        div.appendChild(label);
        field.appendChild(div);
      });
      form.appendChild(field);
    });
    const submit = document.createElement('button');
    submit.type = 'button';
    submit.textContent = 'Grade';
    submit.addEventListener('click', () => {
      let correct = 0;
      data.questions.forEach((q, idx) => {
        const inputs = form.querySelectorAll(`[name="q${idx}"]`);
        const selected = [];
        inputs.forEach((el) => {
          if (el.checked) selected.push(Number(el.value));
        });
        const answer = q.answer.sort().join(',');
        const chosen = selected.sort().join(',');
        if (answer === chosen) correct += 1;
      });
      const score = `${correct}/${data.questions.length}`;
      window.localStorage.setItem(`quiz:${data.id}`, score);
      alert(`Score: ${score}`);
    });
    form.appendChild(submit);
    container.appendChild(form);
  }

  function init() {
    const nodes = document.querySelectorAll('[data-quiz]');
    nodes.forEach(async (node) => {
      const src = node.getAttribute('data-quiz');
      try {
        const res = await fetch(src);
        const data = await res.json();
        renderQuiz(node, data);
      } catch (e) {
        node.textContent = 'Failed to load quiz.';
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
