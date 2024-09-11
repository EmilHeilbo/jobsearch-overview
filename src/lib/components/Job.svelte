<script lang="ts">
  import type { PageData } from "./$types";

  export let job: PageData;
</script>

<article class="job">
  <h2>{job.title}</h2>
  <small>
		🧑‍💻{job.applicant?.name ?? "Unknown applicant"}
  </small>
  <p>🏢{job.company}</p>
  <p>📤{job.dateSent.toDateString()}</p>
</article>
