<template>
    <div class="workTime">
        <div class="heading">
            <h2 id="title">System rejestracji czasu pracy</h2>
                <work-add v-on:reloadlist="getList()" />
                <div class="searchFieldsContainer">
                    <span>Wyszukiwanie wpisów w danym dniu, miesiącu, roku:</span><br/>
                    <input type="text" v-model="search" placeholder="Wpisz datę szukanego zadania (np. '2021-09-08' lub '2021-09' lub '2021' itd)"/>
                    <button @click="clear()" class="btn btn-info">Wyczyść</button>
                </div>
                <br/>
                <div >
                    <span>Wyszukiwanie wpisów według zakresu dat:</span><br/>
                    <input type="text" v-model="search2" placeholder="Od (np. '2020-01-01')"/>
                    <input type="text" v-model="search22" placeholder="Do (np. '2021-06-01')"/>
                    <button @click="searchf()" class="btn btn-primary">Szukaj</button>
                    <button @click="clear2()" class="btn btn-info">Wyczyść</button>
                </div>
        </div>
        <work-list :works="works" v-on:reloadlist="getList()" />
    </div>
</template>

<script>
import WorkAdd from './workAdd.vue'
import WorkList from './workList.vue'

export default {
    components: {
        WorkList,
        WorkAdd
    },
    data: function() {
        return {
            works: [],
            search: '',
            search2: '',
            search22: ''
        }
    },
    
    methods: {
        getList() {
            axios.get('/works')
            .then(response => {
                this.works = response.data
            })
            .catch(error => {
                console.log(error);
            })
        },
        searchdata(value) {
            if(this.search.length > 0)
            {
                axios.get('/work/search/' + value)
                .then(response => {
                    this.works = response.data;
                    //console.log(this.search.length);
                })
                .catch(error => {
                    console.log('blad' + error);
                })
            }
        },
        searchdatarange(value, value2) {
            if(this.search2.length > 0 && this.search22.length > 0)
            {
                axios.get('/work/search/' + value + '/' + value2)
                .then(response => {
                    this.works = response.data;
                })
                .catch(error => {
                    console.log(error);
                })
            }
        },
        clear() {
            this.search = "";
            this.getList();
        },
        clear2() {
            this.search2 = "";
            this.search22 = "";
            this.getList();
        },
        searchf () {
            this.searchdatarange(this.search2, this.search22);
        }
    },
    watch: {
        search () {
            this.searchdata(this.search);
        }
    },
    created() {
        this.getList();
    }
    
}
</script>

<style scoped>
.workTime {
    width: auto;
    margin: 5px;
}

.heading {
    background: #e6e6e6;
    padding: 10px;
}

#title {
    text-align: center;
}

input {
    background: #f7f7f7;
    border: 0px;
    outline: none;
    padding: 5px;
    margin-right: 10px;
    width: 30%;
  } 
.searchFieldsContainer {
    margin-top: 20px;
}


</style>