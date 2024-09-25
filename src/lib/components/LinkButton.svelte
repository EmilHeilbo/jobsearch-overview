<script lang="ts">
	function capitalizeLink(link: string) {
		if (!link) return '';
		let _link = link.slice(8).split('.')[0];
		return _link.slice(0, 1).toUpperCase() + _link.slice(1);
	}
	function getFavicon(link: string) {
		if (!link) return '';
		return `https://${link.slice(8).split('/')[0]}/favicon.ico`
	}
	export let address: string;
</script>

<button on:click={() => window.open(address)}>
	<img src={getFavicon(address)} alt="icon" />
	{capitalizeLink(address)}
</button>
