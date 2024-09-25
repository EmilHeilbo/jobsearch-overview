<script lang="ts">
	import Job from '$lib/components/Job.svelte';
	import LinkButton from '$lib/components/LinkButton.svelte';
	import type { PageData } from './$types';
	let dialog: { showModal: () => any };
	export let data: PageData;
</script>

<aside>
	<section>
		<h1>This is in the sidebar</h1>
		<h2>🔍Job Search Sites</h2>
		<LinkButton address="https://jobindex.dk/jobsoegning" />
		<LinkButton address="https://linkedin.com/jobs" />
		<label
			>🧑‍💻 Job Applicant
			<select id="userSelect">
				{#each data.users as _}
					<option value={_.id}>{_.name}</option>
				{/each}
			</select>
		</label>
		<button class="variant" on:click={dialog.showModal()}>Add Job</button>
	</section>
</aside>

<main>
	<div id="jobs">
	{#each data.jobs as job}
		<Job {job} />
	{/each}
	</div>
</main>
