import { mount } from '@vue/test-utils';
import AppHeader from '../../resources/js/components/AppHeader.vue';

describe('AppHeader.vue', () => {
    test('If user is not logged in, do not show logout button', () => {
        const wrapper = mount(AppHeader);
        expect(wrapper.find('button').isVisible()).toBe(false);
    })
});

describe('AppHeader.vue', () => {
    test('If user is logged in, do shouw logout button', async () => {
        const wrapper = mount(AppHeader);
         wrapper.setData({ loggedIn: true });
         await wrapper.vm.$nextTick();
        expect(wrapper.find('button').isVisible()).toBe(true);    
    })
});