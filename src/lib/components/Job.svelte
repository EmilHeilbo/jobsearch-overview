<script lang="ts">
	// @ts-ignore
	import type { PageData } from './$types';
	import { pluralize } from '$lib/toolbox';

	export let job: PageData;

	const oneDay = 24 * 60 * 60 * 1000;
	const daysPassed = 
		Math.round(Math.abs((job.dateSent - new Date().getTime()) / oneDay));
	let daysPassedText = pluralize(daysPassed, 'day') ?? 'Today';
	if (!daysPassedText.startsWith('To')) {
		daysPassedText += ' ago';
	}
</script>

<article class="job">
	<h1>{job.title}</h1>
	<small> 🧑‍💻 {job.applicant?.name ?? 'Unknown'}</small>
	<p> 🏢 {job.company}</p>
	<small>
		📤 {daysPassedText} |
		{job.distance ? `🚗 ${job.distance} km` : 'N/A'} |
		{job.travelTime
			? `⏱️ ${pluralize(job.travelTime, 'minute')}  |  ` + 
				((job.travelTime * (job.isHybrid ? 3 : 5) * 2) / 60).toFixed(1) +
				" hours/week"
			: 'N/A'}
	</small>
</article>
