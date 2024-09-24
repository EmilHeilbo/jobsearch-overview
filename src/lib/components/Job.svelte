<script lang="ts">
  // @ts-ignore
  import type { PageData } from "./$types";

  export let job: PageData;

  function pluralize(count: number, word: string) {
    if (count == 0) {
      return null
    } else if (count <= 1 && count >= -1) {
      return `${count} ${word}`
    } else {
      return `${count} ${word}s`
    }
  }

  const oneDay = 24 * 60 * 60 * 1000;
  const daysPassed = 
    Math.round(Math.abs((job.dateSent - (new Date()).getTime()) / oneDay));
  let daysPassedText = pluralize(daysPassed, "day") ?? "Today"
  if (!daysPassedText.startsWith("To")) {
    daysPassedText += " ago"
  }
</script>

<article class="job">
  <h1>{job.title}</h1>
  <small>🧑‍💻{job.applicant?.name ?? "Unknown"}</small>
  <p>🏢{job.company}</p>
  <small>
    📤{daysPassedText}
    {job.distance ? `🚗${job.distance} km` : 'N/A'}
    {job.travelTime ? `⏱️${job.travelTime} minutes` : 'N/A'}
  </small>
</article>
