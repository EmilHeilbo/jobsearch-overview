<script lang="ts">
  import type { PageData } from "./$types";

  export let job: PageData;

  const oneDay = 24 * 60 * 60 * 1000;
  const daysPassed = Math.round(Math.abs((job.dateSent - (new Date()).getTime()) / oneDay));
  let daysPassedText: String;
  switch (daysPassed) {
    case 0:
      daysPassedText = "Today";
      break;
    case 1:
      daysPassedText = "1 day ago";
    default:
      daysPassedText = `${daysPassed} days ago`;
      break;
  }
</script>

<article class="job">
  <h2>{job.title}</h2>
  <small>🧑‍💻{job.applicant?.name ?? "Unknown"}</small>
  <p>🏢{job.company}</p>
  <small>📤{daysPassedText}</small>
</article>
